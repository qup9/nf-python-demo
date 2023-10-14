#!/usr/bin/env nextflow

nextflow.enable.dsl=2 

process sayHello {

  container = 'us-east1-docker.pkg.dev/longo-48734/pass/python3:latest'

  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

process processPython {

  // container = 'us-east1-docker.pkg.dev/longo-48734/pass/python3:latest'

  input: 
    val y
  output:
    stdout
  script:
    """
    echo '$y world!'
    python3 --version
    test.py ".\test" $y
    """
}
process processPython2 {

  // container = 'us-east1-docker.pkg.dev/longo-48734/pass/python3:latest'

  input: 
    val y
  output:
    stdout
  script:
    """
    echo '$y world!'
    python3 --version
    test2.py 
    """
}

workflow {

  Channel
    .of('foo', 'bar', 'cluster', 'frack') 
      | sayHello
      | processPython 
      | processPython2
      | view
}

