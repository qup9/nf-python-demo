#!/usr/bin/env nextflow

nextflow.enable.dsl=2 

process sayHello {

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

