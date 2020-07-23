import io
import os
from os import walk

def findAllQueries(dirPath):
    result = []

    for (dirPath, dirNames, fileNames) in walk(dirPath):
        if ("query.txt" in fileNames):
            result.append(dirPath)
        for dirName in dirNames:
            result += findAllQueries(dirName)
    return result


def run(): 
  results = findAllQueries(os.path.abspath(".//queries//"))

  matrixOutput = "::set-output name=matrix::{\"include\":["

  for item in results:
      matrixOutput += "{\"folder\":\""+item+"\"},"

  matrixOutput = matrixOutput[:-1]
  matrixOutput += "]}"
  print(matrixOutput)
  

if __name__ == "__main__":
    run()