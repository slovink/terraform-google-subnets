
 //go:build integration

package integration

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestSubnet(t *testing.T) {
	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/basic",

		Vars: map[string]interface{}{
			"project_id": "pinnacles-data-center",
			"region":     "asia-northeast1",
			"name":       "integration-test",
		},
	})

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	actualSubnetName := terraform.Output(t, opts, "subnet_name")
	subnetSelfLink := terraform.Output(t, opts, "subnet_self_link")

	require.NotEmpty(t, actualSubnetName)
	require.NotEmpty(t, subnetSelfLink)

	assert.True(t, strings.Contains(subnetSelfLink, "/subnetworks/"))
}
