# To run the jobs on different platforms, you can use the following commands:
jobs:
  build:
    runs-on: ${{metrics.os}}
    statrategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macOS-latest]
    OR
    runs-on: ${{metrics.os}}-latest
    statrategy:
      matrix:
        os: [ubuntu, windows, macos]


# Similarly, you can run the jobs on different JDK versions using the following commands:
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        java-version: [ '21', '25' ]