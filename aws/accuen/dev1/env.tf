# module "our_devenv" {
#     source = "git@github.com:accuenmedia/tfm.git//aws/devenv"
#     env = "dev1"
    
    
#     # NOTE - ADD LABEL/COMMENT FOR ANY CIDR RANGE ADDED HERE
#     # CIDR ranges without labels/comments will be removed
#     access_ips = [
#         "104.136.141.97/32", # jeremiah work office
#         "45.30.144.158/32", # jeremiah home office
#         "71.143.194.189/32", # eman home
#         "73.42.71.80/32", # Jason Home
#     ]

#     vpc_private_subnets = ["10.0.32.0/24", "10.0.33.0/24"]
#     vpc_public_subnets = ["10.0.35.0/24", "10.0.36.0/24"]
# }


module "absc" {
    source = "../../../../tfm/aws/bastion"
    env = "${local.env}"
    vpc_id = "${module.this_vpc.vpc_id}"
    subnet_id = "${module.this_vpc.public_subnets[0]}"
 
    # NOTE - ADD LABEL/COMMENT FOR ANY CIDR RANGE ADDED HERE
    # CIDR ranges without labels/comments will be removed
    access_ips = [
        "104.136.141.97/32", # jeremiah work office
        "45.30.144.158/32", # jeremiah home office
        "71.143.194.189/32", # eman home
        "73.42.71.80/32", # Jason Home
    ]
}
