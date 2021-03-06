#!/usr/bin/env bash

##
# @license Copyright 2017 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
##

# run tests with coverage in both root and launcher
yarn run coverage
cd chrome-launcher && yarn run coverage && cd ..
cd lighthouse-cli && yarn run coverage && cd ..

# report to coveralls
./node_modules/.bin/lcov-result-merger '**/lcov.info' | ./node_modules/.bin/coveralls
# report to codecov
./node_modules/codecov/bin/codecov
