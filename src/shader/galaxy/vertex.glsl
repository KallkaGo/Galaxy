uniform float uSize;
attribute float aScale;
attribute vec3 aRandomness;
varying vec3 Vcolor;
uniform float uTime;
void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
/**角度*/
    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceToCenter = length(modelPosition.xz);
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2;
    angle += angleOffset;
    modelPosition.x = sin(angle) * distanceToCenter;
    modelPosition.z = cos(angle) * distanceToCenter;
/**随机性*/
//        modelPosition.x+= aRandomness.x;
//        modelPosition.y+= aRandomness.y;
//        modelPosition.z+= aRandomness.z;
    //   简化
    modelPosition.xyz += aRandomness;


    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

/**Size*/
    gl_PointSize = uSize * aScale;
    gl_PointSize *= (1.0 / -viewPosition.z);

/**Color*/
    Vcolor = color;
}