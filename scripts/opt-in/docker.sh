# Don't stop if docker fails
set +e

# Docker
brew install docker docker-buildx colima

# Ensure the buildx plugin from brew works
yq -i -o=json \
    '.cliPluginsExtraDirs += ["/opt/homebrew/lib/docker/cli-plugins"] | .cliPluginsExtraDirs |= unique' \
    ~/.docker/config.json

# Append "docker" to omz plugins list for completions
if !grep -q "plugins=(.*docker.*)" ~/.zshrc; then
    sed -i 's/plugins=(\([^)]*\))/plugins=(\1 docker)/' ~/.zshrc
    echo "Docker plugin added to ~/.zshrc"
fi

set -e
