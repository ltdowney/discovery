# -*- coding: utf-8 -*-
"""
A setup.py to package up the Lyft Service Discovery client
"""

import datetime
import setuptools


setuptools.setup(
  name='discovery',
  version=datetime.datetime.utcnow().strftime('%Y%m%d.%H%M%S'),
  packages=setuptools.find_packages(),
  entry_points={
    'console_scripts': ['wsgi = app:app.run'],
  },
)
