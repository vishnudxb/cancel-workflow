# cancel-workflow
Cancel a workflow run if a job failed in Github Actions

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- uses: vishnudxb/cancel-workflow@v1.2
  with:
    repo: octocat/hello-world
    workflow_id: ${{ github.run_id }}
    access_token: ${{ github.token }}
```

Sample usage in github action job:

```yaml
jobs:
  job-1:
    name: Run job1
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        token: ${{ secrets.GITHUB_TOKEN }}

    - run: exit 1

    - uses: vishnudxb/cancel-workflow@v1.2
      if: failure()
      with:
        repo: octocat/hello-world
        workflow_id: ${{ github.run_id }}
        access_token: ${{ github.token }}

  job-2:
    name: Run job2
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        token: ${{ secrets.GITHUB_TOKEN }}

    - run: echo "running job2"

  job-n:
    name: Run job `n`

```

If the `job1` fails, we don't want to continue with the other jobs and cancel the workflow.