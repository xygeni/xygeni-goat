from setuptools import setup, find_packages

setup (
    name='typosquatting_bad',
    version='1.0.0',
    packages=find_packages(where='src'),

    install_requires=[
        'requests3==0.0.0'
    ]
)
