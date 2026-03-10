## AWS

### IAM

**Users and Groups**
- Never use or share the root account credentials. Create individual IAM users for each person who needs access to your AWS account, and assign them appropriate permissions.
- Use IAM groups to manage permissions for multiple users. Assign users to groups based on their roles and responsibilities (or departments/teams), and then attach policies to the groups to grant the necessary permissions.
- Instead of assigning permissions directly to users, you can assign permissions to groups.
- Users can belong to multiple groups, and they will inherit the permissions from all the groups they are a part of.
- Groups can not be nested within other groups. Each group is a standalon entity that can have its own set of permissions.

- Users or Groups are assigned JSON documents, called policies. These polciies define the permissions that are granted or denied.
- You should always assigned permissions by POLP (Principle of Least Privilege). This means that you should only grant the permissions that are necessary for a user or group to perform their job functions, and no more. This helps to minimize the risk of accidental or intentional misuse of permissions.
- Inline policies are policies that are directly attached to a single user, group, or role. 

**IAM Policies Structure**
- Version: Specifies the version of the policy language. The current version is "2012-10-17".
- ID: An optional identifier for the policy.
- Statement: A list of individual statements that define the permissions. Each statement includes:
  - Effect: Specifies whether the statement allows or denies access. Valid values are "Allow" and "Deny".
  - Action: Specifies the AWS service actions that are allowed or denied. Actions are typically in the format "service:action", such as "s3:PutObject" or "ec2:StartInstances".
  - Resource: Specifies the AWS resources that the statement applies to. Resources are typically in the format "arn:aws:service:region:account-id:resource-type/resource-id", such as "arn:aws:s3:::my-bucket/*" or "arn:aws:ec2:us-west-2:123456789012:instance/i-1234567890abcdef0". You can also use wildcards (*) to specify all resources or all actions.
- Principal: Specifies the AWS account, user, role, or service that is allowed or denied access. This is typically used in resource-based policies, such as S3 bucket policies or IAM role trust policies.

**Password Policy**
- A password policy is a set of rules that define the requirements for user passwords in an AWS account. It helps to enhance the security of your AWS account by enforcing strong password practices.
- You can set a password policy for your AWS account using the IAM console, AWS CLI, or AWS SDKs. The password policy can include requirements such as:
  - Minimum password length: Specify the minimum number of characters required for a password.
  - Require at least one uppercase letter: Enforce the use of at least one uppercase letter in passwords.
  - Require at least one lowercase letter: Enforce the use of at least one lowercase letter in passwords.
  - Require at least one number: Enforce the use of at least one numeric character in passwords.
  - Require at least one non-alphanumeric character: Enforce the use of at least one special character (e.g., !, @, #, $, etc.) in passwords.
  - Allow users to change their own passwords: Enable or disable the ability for users to change their own passwords.
  - Password expiration: Set a maximum password age to require users to change their passwords after a certain period of time.
  - Password reuse prevention: Specify the number of previous passwords that cannot be reused by users.
- In Enterprise environments, you are likely going to rely on SSO (Single Sign-on) and integrate with an identity provider (IdP) such as Entra ID (formerly Azure AD) or Okta. In this case, the password policy will be managed by the IdP.

**MFA (Mutli-Factor Authentication)**
- MFA device options include:
  - Virtual MFA device: A software-based MFA device that runs on a smartphone or other mobile device. It generates time-based one-time passwords (TOTP) that users can enter when prompted for MFA.
  - U2F security key: A hardware-based MFA device that uses the Universal 2nd Factor (U2F) standard. It typically connects to a computer via USB and provides an additional layer of security when users authenticate.
  - Hardware MFA device: A physical MFA device that generates one-time passwords (OTP) and is typically used in high-security environments. These devices can be purchased from AWS or third-party vendors.

**Accessing AWS as a user**
- AWS Management Console: Users can log in to the AWS Management Console using their IAM credentials (username and password) to access and manage AWS resources through a web-based interface.
- AWS CLI (Command Line Interface): Users can use the AWS CLI to interact with AWS services from the command line. They need to configure their AWS CLI with their IAM credentials (access key ID and secret access key) to authenticate and perform operations on AWS resources.
- AWS SDKs (Software Development Kits): Users can use AWS SDKs in various programming languages.
- Access Keys: Users can generate access keys (access key ID and secret access key) for programmatic access to AWS services. These keys can be used with the AWS CLI, SDKs, or API calls to authenticate and perform operations on AWS resources. It is important to keep access keys secure and rotate them regularly to prevent unauthorized access. Do not share access keys with anyone.

**IAM Roles for services**
- IAM roles are used to grant permissions to AWS services to perform actions on your behalf. For example, you can create an IAM role that allows an EC2 instance to access an S3 bucket. When the EC2 instance assumes the role, it will have the permissions defined in the role's policy to access the S3 bucket.
- To create an IAM role for a service, you can follow these steps:
  1. Go to the IAM console and click on "Roles" in the left navigation pane.
  2. Click on the "Create role" button.
  3. Select the AWS service that you want to grant permissions to (e.g., EC2, Lambda, etc.).
  4. Choose the specific use case for the service (e.g., EC2 instance, Lambda function, etc.).
  5. Attach the necessary policies that define the permissions for the role.
  6. Review and create the role.
- Once the role is created, you can assign it to the appropriate AWS service (e.g., EC2 instance, Lambda function, etc.) to allow it to perform actions on your behalf based on the permissions defined in the role's policy.
- It is important to follow the Principle of Least Privilege (POLP) when creating IAM roles for services. Only grant the permissions that are necessary for the service to perform its intended functions, and avoid granting excessive permissions that could lead to security risks.

**IAM Security Tools**
- IAM Credentials Report (account-level): Provides a report of all IAM users in the account, including their access keys, password status, and MFA status. This report can help you identify any security risks or compliance issues related to IAM users.
- IAM Access Analyzer (account-level): Analyzes resource-based policies to identify any potential security risks or unintended access. It helps you understand who has access to your resources and whether that access is appropriate.
- IAM Access Advisor (user-level): Provides information about the services that a user has accessed and the permissions that have been used. This can help you identify any unused permissions or potential security risks associated with a user's access.

**IAM Summary**
Users - mapped to a physical user, has a password for AWS Console
Groups - contains users only
Policies - JSON document that outlines permissions for users or groups
Roles - for EC2 instances or AWS services
Security - MFA + Password policy
AWS CLI - manage your AWS services using the command-line
AWS SDK - manage your AWS services using a programming language
Access Keys - access AWS using the CLI or SDK
Audit - IAM Crendential Reports & IAM Access Advisor