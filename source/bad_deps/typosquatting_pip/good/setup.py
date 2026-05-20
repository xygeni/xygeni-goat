from setuptools import setup, find_packages

setup (
    name='typosquatting_good',
    version='1.0.0',
    packages=find_packages(where='src'),

    install_requires=[
        'requests==2.28.1'
    ]
)
