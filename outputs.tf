output "web_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "URL of the deployed website"
  value       = "http://${aws_instance.web.public_ip}"
}

output "db_public_ip" {
  description = "Public IP of the database server"
  value       = aws_instance.db.public_ip
}

output "db_private_ip" {
  description = "Private IP of the database server"
  value       = aws_instance.db.private_ip
}
