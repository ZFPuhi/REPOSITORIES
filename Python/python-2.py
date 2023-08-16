import paramiko

def deploy_to_server(hostname, username, password, local_file, remote_path):
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    try:
        ssh_client.connect(hostname, username=username, password=password)
        sftp = ssh_client.open_sftp()
        sftp.put(local_file, remote_path)
        print("Deployment successful!")
    except Exception as e:
        print(f"Deployment failed: {e}")
    finally:
        ssh_client.close()

if __name__ == "__main__":
    hostname = "example.com"
    username = "user"
    password = "password"
    local_file = "app.jar"
    remote_path = "/opt/app/"
    
    deploy_to_server(hostname, username, password, local_file, remote_path)

# An easy script that automates the deployment of an application to a server.