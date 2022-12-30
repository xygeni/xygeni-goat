from setuptools import setup, find_packages

setup (
    name='dependency_confusion',
    version='1.0.0',
    packages=find_packages(where='src'),

    install_requires=[
        'tensrflow'
    ]
)
