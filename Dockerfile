FROM ghcr.io/dasctf-offical/docker-template-for-web-python2-mysql:main

COPY src /app/

# 安装依赖请务必在构建阶段完成！
RUN pip install -r /app/requirements.txt

# 如需自定义启动命令请覆盖 APP_CMD 环境变量
# ENV APP_CMD="python2 app.py"

# 如需自定义 FLAG 请将自定义脚本覆盖到 /flag.sh
COPY files/flag.sh /flag.sh

# 如需操作数据库请将 sql 文件拷贝到 /db.sql
COPY files/db.sql /db.sql

# 如有上传文件等操作请务必将权限设置正确！
# RUN chown app:app /app/uploads/
# 如需静态 FLAG 请在此利用环境变量声明
# ENV DASFLAG=DASCTF{flag_test}
# 请声明对外暴露端口
EXPOSE 5000