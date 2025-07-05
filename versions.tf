terraform {
# バージョン
required_version = ">= 1.3.0" 

backend "s3" {
    //バケットの名前
    bucket  = "kdg-aws-2025-yuga193" 
    //保存するファイル名
    key     = "tfstate/terraform.tfstate" 
    //リージョン
    region  = "ap-northeast-1" 
    //サーバーサイド暗号化
    encrypt = true 
}
}

//現在はAWSの認証情報がないのでエラー。アクセスキーとシークレットキーを渡しましょう