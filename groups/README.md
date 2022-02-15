Hi there! Welcome to Kevala! 

As a member of the engineering team, you've been directed towards this repo to set up your Google Cloud console access. 

To get started, go ahead and clone this repository and checkout a new branch

Open main.tf. Inside you'll find multiple `module` declarations like the block below. 

* If you're creating a new group, go ahead and copy-paste another group's declaration - don't forget to change the friendly name of the module (the "example_kevala_group" bit)! If you run into issues, Infra team is here to help! 
 
 
* If you're editing an existing group, you can simply add your user to the `group_members` input for any groups in which you need membership.


`project_id` can be interpolated using a data source, terraform cloud outputs, or simply in-line!
```terraform
module "example_kevala_group" {
  source = "./modules/kevala_gcp_groups"
  group_name = "example-group"
  project_id = "test-project-id"
  group_email = "examplegroup@kevala.com"
  role_to_grant = "bigquery/admin"
  group_members = ["firstName.lastName"]
}
```


Add yourself to multiple lists if you need access to multiple groups!
