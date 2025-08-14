# For more information about this image:
#   - https://hub.docker.com/r/lacamposm/docker-helpers
FROM lacamposm/docker-helpers:pyspark-conda-0.1.3

WORKDIR /ucentral-tesis-project

COPY environment.yml /tmp/environment.yml

ARG USER_UID=1000
ARG USER_GID=1000

RUN conda env create -f /tmp/environment.yml -n ucentral-project-env  \
    && conda clean --all --yes \
    && rm /tmp/environment.yml \
    && printf "source /opt/conda/etc/profile.d/conda.sh\nconda activate ucentral-project-env \n" \
       > /etc/profile.d/conda-env.sh \
    && groupadd --gid $USER_GID dev-user \
    && useradd --uid $USER_UID --gid $USER_GID -m dev-user \
    && chown -R dev-user:dev-user /ucentral-tesis-project \
    && { \
         echo "source /opt/conda/etc/profile.d/conda.sh"; \
         echo "conda activate ucentral-project-env "; \
       } >> /home/dev-user/.bashrc \
    && chown dev-user:dev-user /home/dev-user/.bashrc

USER dev-user

# 4040-Spark UI, 8501-Streamlit, 8888-Jupyter, 5678-Debugpy
EXPOSE 4040 8501 8888 5678

CMD ["/bin/bash"]
