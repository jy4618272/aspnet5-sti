FROM muffycompo/aspnet

MAINTAINER Mfawa Alfred Onen <muffycompoqm@gmail.com>

ENV BUILDER_VERSION 1.0
ENV APP_HOME=/opt/app-root/src
ENV DNX_NO_MIN_VERSION_CHECK=1

LABEL io.k8s.description="Source-To-Image builder for building ASP.NET 5 applications" \
      io.k8s.display-name="builder aspnet5" \
      io.openshift.expose-services="5004:http" \
      io.openshift.s2i.scripts-url="image:///usr/local/sti" \
      io.openshift.tags="builder,aspnet5"

COPY ./.s2i/bin/ /usr/local/sti

WORKDIR ${APP_HOME} 

USER 1001 

EXPOSE 5004

CMD ["usage"]
