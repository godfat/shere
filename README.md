# Shere

by Lin Jen-Shin ([godfat](http://godfat.org))

## LINKS:

* [github](https://github.com/godfat/shere)
* [rubygems](http://rubygems.org/gems/shere)

## DESCRIPTION:

_Share_ the directory _here_ with [Nginx][]!
Shere would create a temporary Nginx config and run an
Nginx instance to serve the directory you specified.

## REQUIREMENTS:

* Any Ruby 1.8+
* [Nginx][]

## INSTALLATION:

    gem install shere

## SYNOPSIS:

    shere
    shere --help
    shere -p 8080 ~/public
    sudo shere -u nobody

[Nginx]: http://nginx.org/

## LICENSE:

Apache License 2.0 (Apache-2.0)

Copyright (c) 2011~2018, Lin Jen-Shin (godfat)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
