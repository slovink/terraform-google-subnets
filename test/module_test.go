package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestModule(t *testing.T) {
	t.Parallel()

	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example",
	})

	// Test ke end me resources hamesha destroy honge
	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	subnetID := terraform.Output(t, opts, "subnet_id")
	subnetName := terraform.Output(t, opts, "subnet_name")
	selfLink := terraform.Output(t, opts, "subnet_self_link")

	assert.NotEmpty(t, subnetID)
	assert.NotEmpty(t, subnetName)
	assert.Contains(t, selfLink, "/subnetworks/")
	assert.True(t, strings.HasSuffix(selfLink, subnetName))
}