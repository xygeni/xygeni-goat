from setuptools import setup, find_packages

setup (
    name='malware',
    version='1.0.0',
    packages=find_packages(where='src'),

    install_requires=[
        'purposefully-malicious==1.0.0'
    ]
)
