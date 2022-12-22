varying vec3 Vcolor;
void main() {
    float strength = distance(gl_PointCoord, vec2(0.5));
//    strength *= 2.0;
    strength = 1.0 - strength;
    strength = pow(strength,10.0);

    /**Color*/
    vec3 finallyColor = mix(vec3(0.0),Vcolor,strength);
    gl_FragColor = vec4(vec3(finallyColor), 1.0);
}