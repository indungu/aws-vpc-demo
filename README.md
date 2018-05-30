# Configuration Management

This is a simple configuration management example using Packer to build AMI's and then use Ansible for provisioning

The packer template file `image-template.json` is in the `packer` directory.

### Building Ansible provised AWS AMIs

#### Pre-requisites
Please ensure your system has the following installed:
1. [Packer](https://www.packer.io/docs/install/index.html)
2. [Ansible](https://docs.ansible.com/ansible/2.4/intro_installation.html)

To build your own AMIs of the Yummy Recipes REST API, just follow this steps

1. Clone the repository on the `config-management` branch
    ```bash
    $ git clone https://github.com/indungu/aws-vpc-demo.git setup/
    ```
2. Switch to the configuration/packer directory
    ```bash
    $ cd setup/configuration/packer
    ```
3. Export your AWS API security credentials to your environment
    ```bash
    $ export aws_access_key={YOUR_AWS_ACCOUNT_ACCESS_KEY}
    $ export aws_secret_key={YOUR_AWS_ACCOUNT_SECRET_KEY}
    ```
    > _Note_: On exporting the above variables with the keys specified, you will have to edit the `{{env `indungu_aws_access_key`}}` and `{{env `indungu_aws_secret_key`}}` in the `configuration/packer/api-image-us-e2-template.json` file to: `{{env `aws_access_key`}}` and `{{env `aws_access_key`}}`.
4. Validate the `image-template.json` file
    ```bash
    $ packer validate image-template.json
    ```
5. Build the `image-template.json` file
    ```bash
    $ packer build image-template.json
    ```
6. Login to your AWS Console and check your AMIs on the EC2 dashboard, you should have the new AMI in the list.

#### Notes
You can launch a new instance with this image by simply clicking the launch button when the image is selected.
While launching be sure to configure/select a security group with the following rules set.

![image](https://user-images.githubusercontent.com/30072633/39813336-af65afec-5398-11e8-82ab-c75b8b07e71d.png)

