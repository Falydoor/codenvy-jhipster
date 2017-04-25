# Copyright (c) 2012-2016 Codenvy, S.A.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
# Contributors:
# Codenvy, S.A. - initial API and implementation

FROM codenvy/ubuntu_jdk8

USER user

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && sudo apt-get install yarn

# install yeoman bower gulp jhipster
RUN sudo yarn global add yo bower gulp-cli generator-jhipster

EXPOSE 6080 8080 9000 3001
WORKDIR /projects
CMD sudo /usr/sbin/sshd -D && \
    tail -f /dev/null