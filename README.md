# Configuration Management

This is a simple configuration management example using Packer to build AMI's and then use Ansible for provisioning

The packer template file `image-template.json` is in the `packer` directory.

### Building Ansible Provisioned AWS AMIs

#### Pre-requisites
Please ensure your system has the following installed:
1. [Packer](https://www.packer.io/docs/install/index.html)
2. [Ansible](https://docs.ansible.com/ansible/2.4/intro_installation.html)

To build your own AMIs of the Yummy Recipes REST API, just follow this steps

1. Clone the repository on the `master` branch
    ```bash
    $ git clone https://github.com/indungu/aws-vpc-demo.git 
    ```
2. Switch to the configuration/packer directory
    ```bash
    $ cd configuration/packer
    ```
3. Export your AWS API security credentials to your environment
    ```bash
    $ export aws_access_key={YOUR_AWS_ACCOUNT_ACCESS_KEY}
    $ export aws_secret_key={YOUR_AWS_ACCOUNT_SECRET_KEY}
    ```
    > _Note_: On exporting the above variables with the keys specified, you will have to edit the {{env `indungu_aws_access_key`}} and {{env `indungu_aws_secret_key`}} in the `configuration/packer/api-image-us-e2-template.json` file to: {{env `aws_access_key`}} and {{env `aws_access_key`}}.
4. Validate the `*-template.json` files
    ```bash
    $ packer validate *-template.json
    ```

    > The wildcard character in the above and below commands is intended to imply that you should run the specified command against each of the files ending in `-template.json`
5. Build the `*-template.json` file
    ```bash
    $ packer build *-template.json
    ```
6. Login to your AWS Console and check your AMIs on the EC2 dashboard, you should have the new AMIs in the list.

#### Notes
The above AMIs are about 97% configured and might require some slight manual configuration once the instances are fabricated.

# Infrastructure Management

This section is a step by step guide on how to perform a basic cloud orchestration to create a simple VPC as detailed in [this here article](https://medium.com/@isaacndungu/immutable-infrastructure-with-terraform-on-aws-523336c1395a).

### Building custom AWS VPC with Terraform

#### Pre-requisites

The Terraform scripts contained here in require that you have following installed on your system for the orcherstation to run successfully.

1. [Terraform CLI](https://www.terraform.io/docs/commands/index.html)
2. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
3. A public domain name hosted on Amazon's Route 53
4. Create am SSH key pair named `yummy` in the US EAST 2 (Ohio) Region.

> You can get a free domain name on [Freenom](http://www.freenom.com/) and follow [this](https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html) AWS
resource on how to configure your hosted domain to the domain name you acquired.
Once this is done replace the `name` value for `personal_domain` data value in the `data-sources.tf` file [Line 45]

Follow the respective install instructions provied by each vendor and ensure that this tools are a present on your workstation before proceeding.

To create your VPC, Subnets, Security Groups, Inastances, Load Balancers and respective Target Groups, follow this steps:

1. Change to the `infrastructure/aws_terraform/` directory
    ```bash
    $ cd ../../infrastructure/aws_terraform/
    ```
2. Initialize terraform
    ```bash
    $ terraform init
    ```
    
    > This should create a `.terraform/` directory
3. Validate configuration 
    ```bash
    $ terraform validate
    ```
3. Apply configuration 
    ```bash
    $ terraform apply
    ```

4. Approve configuration application
    ```bash
    Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value:
    ```

    > type `yes` and press enter to accept the creation of the resources

On successful completion you should receive a prompt similar to this one
`Apply complete! Resources: 34 added, 0 changed, 0 destroyed.`

