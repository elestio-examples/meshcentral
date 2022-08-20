# MeshCentral on Elestio with CI/CD

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/meshcentral"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy MeshCentral on Elestio.

# Once deployed ...

You are now able to sign to the Admin UI here:
    
    https://[CI_CD_DOMAIN]/
    login: [ADMIN_LOGIN] (set in env var ADMIN_LOGIN)
    password: [ADMIN_PASSWORD] (set in env var ADMIN_PASSWORD)

Once logged-in, create a group of machines and add a new agent, there select your platform (Windows, Mac, Linux, ...) and install the agent on all your computers / servers.