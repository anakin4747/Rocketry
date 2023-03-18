from setuptools import setup, find_packages


setup(
	name="readI2C",
	version="1.1.1",
	description="A program to run on a raspberry pi to collect data from a sensor over I2C",
	author="Anakin Childerhose",
	author_email="achilde@uwo.ca",
	url="https://github.com/anakin4747/Rocketry",
	packages=find_packages(),

	entry_points={
		'console_scripts': [
			'senseI2C=src.main:main'
        ]
    }
)


