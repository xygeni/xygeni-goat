from setuptools import setup, find_packages

setup (
    name='anomaly',
    version='1.0.0',
    packages=find_packages(where='src'),

    install_requires=[
        'pyslqite3==3.0.1'
    ]
)
