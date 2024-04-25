CC = gcc
CFLAGS = -std=c99 \
         -DCONFIG_XINERAMA -DCONFIG_LIBCONFIG -DCONFIG_REGEX_PCRE \
         -DCONFIG_REGEX_PCRE_JIT -DCONFIG_VSYNC_DRM -DCONFIG_VSYNC_OPENGL \
         -DCONFIG_VSYNC_OPENGL_GLSL -DCONFIG_VSYNC_OPENGL_FBO \
         -DCONFIG_VSYNC_OPENGL_VBO -DCONFIG_DBUS -DCONFIG_XSYNC -DCONFIG_C2 \
         -I/usr/include/libdrm -I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include\
         -DNDEBUG -D_FORTIFY_SOURCE=2 -I/usr/include/ 
LDFLAGS = -O1 #-Wall -O2#-Wl, -Wl,--as-needed
LDLIBS = -lGL -lm -lrt -lpcre -lXcomposite -lXdamage -lXfixes -lXrender -lX11 -lXext -lXrandr -lXinerama -lconfig -ldbus-1
SRCS = $(wildcard src/*.c)
TARGET = xcomp
all: $(TARGET)
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
clean:
	rm -f $(TARGET)
run: clean all
	./$(TARGET)
.PHONY: all clean run