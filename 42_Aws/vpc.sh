AWS_VPC=vpc-00b8ce414e51f6891

good() {
	if [[ $? -eq 0 ]]; then
		echo "Command succeeded"
	else
		echo "Command failed"
	fi
	}

aws ec2 create-tags --resources $AWS_VPC --tags Key=Name,Value=DevOpsVPC
aws ec2 modify-vpc-attribute --vpc-id $AWS_VPC --enable-dns-hostnames "{\"Value\":true}"
good
aws ec2 modify-vpc-attribute --vpc-id $AWS_VPC --enable-dns-support "{\"Value\":true}"
good
