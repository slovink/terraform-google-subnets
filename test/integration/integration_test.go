
 //go:build integration

package integration

import (
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestSubnet(t *testing.T) {
	project := strings.TrimSpace(os.Getenv("GOOGLE_CLOUD_PROJECT"))
	if project == "" {
		t.Fatal("GOOGLE_PROJECT environment variable is required")
	}

	network := strings.TrimSpace(os.Getenv("GOOGLE_NETWORK"))
	if network == "" {
		t.Fatal("GOOGLE_NETWORK environment variable is required")
	}

	region := strings.TrimSpace(os.Getenv("GOOGLE_REGION"))
	if region == "" {
		region = "asia-northeast1"
	}

	subnetName := "it-" + strings.ToLower(random.UniqueId())

	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../",

		Vars: map[string]interface{}{
			"name":        "jenkins-subnet",
			"environment": "integration",
			"project_id":  "pinnacles-data-center",
			"region":      "asia-northeast1",
			"network":     network,
			"ip_cidr_range": "10.20.0.0/24",
		},
	})

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	actualSubnetName := terraform.Output(t, opts, "subnet_name")
	subnetSelfLink := terraform.Output(t, opts, "self_link")
	subnetRegion := terraform.Output(t, opts, "subnet_region")

	require.NotEmpty(t, actualSubnetName)
	assert.Equal(t, subnetName, actualSubnetName)
	assert.Contains(t, subnetSelfLink, "/subnetworks/")
	assert.Equal(t, region, subnetRegion)
}
