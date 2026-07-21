# USER_C_MODULES combinado: cámara moderna + TFLite Micro (microlite).
# Rutas absolutas inyectadas por el workflow vía -D CAM_API_DIR / TFLM_MP_DIR,
# o variables de entorno en builds locales.

if(NOT DEFINED CAM_API_DIR)
  if(DEFINED ENV{CAM_API_DIR})
    set(CAM_API_DIR "$ENV{CAM_API_DIR}")
  else()
    message(FATAL_ERROR "CAM_API_DIR no definido (ruta a micropython-camera-API)")
  endif()
endif()

if(NOT DEFINED TFLM_MP_DIR)
  if(DEFINED ENV{TFLM_MP_DIR})
    set(TFLM_MP_DIR "$ENV{TFLM_MP_DIR}")
  else()
    message(FATAL_ERROR "TFLM_MP_DIR no definido (ruta a tensorflow-micropython-examples)")
  endif()
endif()

message(STATUS "autonomus firmware: CAM_API_DIR=${CAM_API_DIR}")
message(STATUS "autonomus firmware: TFLM_MP_DIR=${TFLM_MP_DIR}")

# 1) Cámara (cnadler86) — import camera / Camera / PixelFormat / FrameSize
include("${CAM_API_DIR}/micropython.cmake")

# 2) Solo microlite (sin ulab ni el driver de cámara viejo de mocleiri)
include("${TFLM_MP_DIR}/micropython-modules/microlite/micropython.cmake")
