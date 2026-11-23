
@Library('slovink-terratest@v1') _

terratestPipeline(
    testProject               : 'pinnacles-data-center',

    unitCredentialsId         : 'gcp-terratest-readonly',
    integrationCredentialsId  : 'gcp-terratest-int',

    integrationTimeoutMin     : 90,
    lockLabel                 : 'gcp-terratest-slot',

    podTemplate               : 'terratest',
    slackChannel              : '#infra-ci',

    e2eJob                    : 'slovink/terraform-google-e2e/main'
)
