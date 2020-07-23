import io
import os
import shutil
from os import walk

def run():
  folderPath = os.getenv("folderPath")
  shutil.copyfile(os.path.join(os.getcwd(), '.github/actions/generate-arm/template.json'), os.path.join(folderPath, 'azuredeploy.json'))

  with open(os.path.join(folderPath, "query.txt"), "r") as query_file:
    query_lines = query_file.readlines()    

  query = ""
  for query_line in query_lines:
    query += query_line.replace("\"", "\'").replace("\n", " ")

  folderName = list(filter(None, folderPath.split('/')))[-1]

  with open(os.path.join(folderPath, "azuredeploy.json"), "r") as template_file:
    template_content = template_file.read()

  template_content = template_content.replace("QUERY_CODE", query)
  template_content = template_content.replace("QUERY_NAME", folderName)

  with open(os.path.join(folderPath, "azuredeploy.json"), "w") as template_file:
    template_file.write(template_content)

  for (dirPath, dirNames, fileNames) in walk(folderPath):
    print(fileNames)


if __name__ == "__main__":
  run()