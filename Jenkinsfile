@Library('slovink-terratest@v1') _

terratestPipeline(
     testProject             : 'pinnacles-data-center',
      unitCredentialsId       : 'gcp-terratest-readonly',   // unit stage: terraform plan only (roles/viewer)
     integrationCredentialsId: 'gcp-terratest-int',        // integration stage: real apply + destroy

     integrationtimeoutMinutes   : 90,                          // integration stage: timeout in minutes
     locklabel                   : 'gcp-terratest-slot',      // lock label for integration stage
     podTemplate          : 'terratest',            // pod template name for integration stage
     slackChannel         : '#infra-ci',       // slack channel for notifications
     e22job                 : 'slovink/terraform-google-e2e/main'                       // enable e2e job
)