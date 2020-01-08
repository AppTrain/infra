module "this_buildenv" {
  source     = "../../../terraform-modules/buildenv"
  env        = "build-ops"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJG9/JrL8z7wciJIdjkKoHh7G7OfgOxtO/6+JwAbVN/sfgpPZ2tlCKHQEluvCvqj8mAj12EIKJY35eWd4LTQycWDXtlQ3oqwrUUsZ5YWyKIKO2WZKTnGuqH5eQrSiVBlocbDt1fiXIkE1CYvGPjVa+dTGSiva0wTjLmSrH7wC6tFmLN1k+JTqEqkYMuwCHY4e89TE64bgTYHtMbaRIzLQsHwL5Rgm0XTh4SMAgW68KhQy8Te1BZD0+60e2unUCrObP8GE0liDUsfmNdslRKzj88KXh3wW+NYuz1hd9spzNUJ15/o5XU6WB46AzLYBePizcKSxGhscxPDB/YwWoyxsJETqj2lA/kPsnCEMV9ERO3w/fgH4/2+LnUmwvr8zNjVgYuAWFUkyvKrPDhnBYL88t7PM3jXJyDPm/CGhbNA+ILs4TpfIvAMn16GjsCc2zdEp3AAXzATF5s/J+Qp5V5zAsDnn5eNsHwABFVQ+Z2PrSLfDz+DY97EdxFCpfL+XMR6TO4wUEntBz6wx9t7Tunp4xzUk/t8D6sGpNIkTeLwnIMmsBa2yzxBkO7unpFF/5NzZexsXjTZFkVeSB91XurDf69Kw+45Q9Xfals+68Ut086/GQiO8Diq7D7fA3oit2yVA9VALbTsvHdajjEGcIeyKnaPGSK41G6et+Igju+rdoWQ== Jeremiah’siPhone"

  # NOTE - ADD LABEL/COMMENT FOR ANY CIDR RANGE ADDED HERE
  # CIDR ranges without labels/comments will be removed
  access_ips = [
    "104.136.141.97/32", # jeremiah work office
    "45.30.144.158/32",  # jeremiah home office
    "184.91.138.113/32", # jeremiah TEMPORARY (hurricane office)
    "71.143.194.189/32", # eman home
    "73.42.71.80/32",    # Jason Home
  ]
}
