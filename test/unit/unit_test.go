//go:build unit

package unit

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicPlan(t *testing.T) {
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
			"name":       "ut-" + strings.ToLower(random.UniqueId()),
		},
		PlanFilePath: filepath.Join(t.TempDir(), "plan.out"),
	})

	// Sirf init + plan. Koi resource nahi banta.
	plan := terraform.InitAndPlanAndShowWithStruct(t, opts)

	counts := map[string]int{}
	for _, res := range plan.ResourcePlannedValuesMap {
		counts[res.Type]++
	}
	t.Logf("planned resources: %v", counts)

	assert.Greater(t, counts["google_compute_subnetwork"], 0, "subnetwork plan me nahi hai")
}