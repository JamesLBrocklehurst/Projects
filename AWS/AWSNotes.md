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