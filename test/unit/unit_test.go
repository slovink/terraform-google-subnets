
 //go:build unit

package unit

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestBasicPlan(t *testing.T) {
	t.Parallel()

	// 1. Read project ID from environment
	project := strings.TrimSpace(os.Getenv("GOOGLE_CLOUD_PROJECT"))
	require.NotEmpty(t, project, "GOOGLE_CLOUD_PROJECT environment variable is required")

	// 2. Read region from environment; use default if not provided
	region := strings.TrimSpace(os.Getenv("GOOGLE_REGION"))
	if region == "" {
		region = "asia-northeast1"
	}

	// 3. Generate unique name for this test
	name := "ut-" + strings.ToLower(random.UniqueId())

	// 4. Configure Terraform
	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/basic",

		Vars: map[string]interface{}{
			"project_id": project,
			"region":     region,
			"name":       name,
		},

		PlanFilePath: filepath.Join(t.TempDir(), "plan.out"),
	})

	// 5. Run Terraform Init and Plan only
	// No actual GCP resources will be created
	plan := terraform.InitAndPlanAndShowWithStruct(t, opts)

	// 6. Verify planned resources
	subnetCount := 0

	for _, resource := range plan.ResourcePlannedValuesMap {
		if resource.Type == "google_compute_subnetwork" {
			subnetCount++
		}
	}

	t.Logf("Project: %s", project)
	t.Logf("Region: %s", region)
	t.Logf("Test subnet name: %s", name)
	t.Logf("Planned subnet count: %d", subnetCount)

	// 7. Assert that at least one subnet is planned
	require.Greater(
		t,
		subnetCount,
		0,
		"Terraform plan should contain at least one google_compute_subnetwork",
	)
}
