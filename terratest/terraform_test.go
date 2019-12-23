package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
// Make sure you have the dep binary, https://github.com/golang/dep
// Run 'dep ensure' before run test cases.

func TestTerraformBasicEip(t *testing.T) {
	t.Parallel()
	uniqueId := random.UniqueId()
	uniqueName := fmt.Sprintf("tf-testAcc%s", uniqueId)
	eipName := uniqueName

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":                 eipName,
			"description":          "test",
			"bandwidth":            "10",
			"internet_charge_type": "PayByBandwidth",
			"instance_charge_type": "PostPaid",
			"isp":                  "BGP",
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualName := terraform.Output(t, terraformOptions, "this_eip_name")
	actualDescription := terraform.Output(t, terraformOptions, "this_eip_description")
	actualInternetChargeType := terraform.Output(t, terraformOptions, "this_eip_internet_charge_type")
	actualInstanceChargeType := terraform.Output(t, terraformOptions, "this_eip_instance_charge_type")
	actualBandwidth := terraform.Output(t, terraformOptions, "this_eip_bandwidth")
	actualIsp := terraform.Output(t, terraformOptions, "this_eip_isp")
	actualInstanceType := terraform.Output(t, terraformOptions, "this_eip_association_instance_type")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, eipName, actualName)
	
	assert.Equal(t, "PayByBandwidth", actualInternetChargeType)
	assert.Equal(t, "PostPaid", actualInstanceChargeType)
	assert.Equal(t, "10", actualBandwidth)
	assert.Equal(t, "BGP", actualIsp)
	assert.Equal(t, "test", actualDescription)
	assert.Equal(t, "SlbInstance", actualInstanceType)
}
