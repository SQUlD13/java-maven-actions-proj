# simple-java-maven-app

Forked from the [Jenkins user documentation for a simple Maven based pipeline](https://github.com/jenkins-docs/simple-java-maven-app), meant to replicate it's functionality using GitHub Actions, with the addition of:
- Having semantic versioning integrated, which is automatically updated with each push to main.
- A Docker image build step using the generated artifact
- Publishing the image to a registry - DockerHub in my case

The `.github/workflows/java-pipeline.yml` is the main focus of this project - but available for view is a `bump_ver.sh` script under the `scripts` directory - using git tags to automatically increment a tag, and push it to the Repo.

the original `jenkins` directory remains untouched, containing the original script given as an example from the documentation.