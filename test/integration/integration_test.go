//go:build integration

package integration

import (
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicApply(t *testing.T) {
	t.Parallel()

	project := strings.TrimSpace(os.Getenv("GOOGLE_PROJECT"))
	if project == "" {
		t.Fatal("GOOGLE_PROJECT set karo")
	}

	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/basic",
		Vars: map[string]interface{}{
			"project_id": project,
			"region":     "asia-northeast1",
			"name":       "it-" + strings.ToLower(random.UniqueId()),
		},
	})

	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	subnetID := terraform.Output(t, opts, "subnet_id")
	selfLink := terraform.Output(t, opts, "subnet_self_link")

	assert.NotEmpty(t, subnetID)
	assert.Contains(t, selfLink, "/subnetworks/")
}