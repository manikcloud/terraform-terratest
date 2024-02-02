package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestS3BucketModule(t *testing.T) {
    terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
        // Set the path to the Terraform code that will be tested.
        TerraformDir: ".",
    })

    // Clean up resources with "terraform destroy" at the end of the test.
    defer terraform.Destroy(t, terraformOptions)

    // Initialize and apply the Terraform code.
    terraform.InitAndApply(t, terraformOptions)

    // Run your assertions here. For example, you could check if the S3 bucket has versioning enabled.
    bucketVersioning := terraform.Output(t, terraformOptions, "bucket_versioning")
    assert.Equal(t, "Enabled", bucketVersioning)
}
