# Source: https://www.youtube.com/watch?v=jpkZGXrhZJ8


import luigi
import os
from time import sleep


# Makes Hello File
class HelloTask(luigi.Task):
	def run(self):
		sleep(60)
		with open(self.path,'w') as hello_file:
			hello_file.write('Hello')
			hello_file.close()

	def output(self):
		return luigi.LocalTarget(self.path)

	def requires(self):
		return [
		MakeDirectory(path=os.path.dirname(self.path)),
		]

# Make Word File
class WorldTask(luigi.Task):
	
	def run(self):
		sleep(30)
		with open(self.path,'w') as world_file:
			world_file.write('World')
			world_file.close()

	def output(self):
		return luigi.LocalTarget(self.path)

	def requires(self):
		return [
		MakeDirectory(path=os.path.dirname(self.path))
		]


# Combine Hello and World Files, and Creaet a new File
class HelloWorldTask(luigi.Task):
	id = luigi.Parameter(default='test')

	def output(self):
		path = 'results/{}/hello_world.txt'.format(self.id)
		return luigi.LocalTarget(path)

	def run(self):
		with open(self.input()[0].path,'r') as hello_file:
			hello = hello_file.read()
		with open(self.input()[1].path,'r') as world_file:
			world = world_file.read()
		with open(self.output().path, 'w') as output_file:
			content = '{} {}!'.format(hello, world)
			output_file.write(content)
			output_file.close()

	def requires(self):
		return[
			HelloTask(path = 'results/{}/hello.txt'.format(self.id)),
		 	WorldTask(path = 'results/{}/world.txt'.format(self.id))]


# Make Directory
class MakeDirectory(luigi.Task):
	path = luigi.Parameter()

	def output(self):
		return luigi.LocalTarget(self.path)

	def run(self):
		os.makedirs(self.path)

if __name__ == '__main__':
	luigi.run()
	
# Run Instructions
# 1. Navigate to your local directory
# RUn the scheduler with Command: luigid
# 2. Command: python hello_world_parameterized.py HelloWorldTask