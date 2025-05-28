    #!/bin/bash
    set -e
    
    # Get all tags
    git fetch --tags --unshallow

    # Get latest tag or fallback to v1.0.0
    latest_tag=$(git tag --sort=-v:refname | grep '^v' | head -n 1)
    [[ -z "$latest_tag" ]] && latest_tag="v1.0.0"

    # Extract version numbers
    version="${latest_tag#v}"
    IFS='.' read -r major minor patch <<< "$version"
    new_tag="v$major.$minor.$((patch + 1))"

    echo "Bumping version: $latest_tag → $new_tag"

    git config user.name "github-actions"
    git config user.email "github-actions@github.com"
    git tag "$new_tag"
    git push origin "$new_tag"