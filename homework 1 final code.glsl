float plot(vec2 st, float pct){
  return  smoothstep( pct-0.03, pct, st.y*1.6) -
          smoothstep( pct, pct+0.03, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/resolution;
    float y = 0.0;
    if (time < 60.0) y = exp(sin(st.x*(time + 100000.0)));
    else if (time > 60.0) y = sqrt(-tan(st.x*(time + 100000.0)));
    
    float pct = plot(st, y);
    vec3 color = vec3(y);
    
    color = pct * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), st.y);
    
    gl_FragColor = vec4(color, 1.0);
    
    
    if (time > 15.0 && time < 60.0) {
        vec2 p = uvN();
        for (float i = 0.; i < 5.; i++) {
            p.y +=sin(p.y + time * i);
            color += abs(.02 / p.y) * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0),st.y);
        }
    
        gl_FragColor = vec4(color, 1.0);
    }
    
    //Second sine wave array
    if (time > 30.0 && time <= 60.0)  {
        vec2 p = uv();
        for (float i = 0.; i < 5.; i++) {
        p.x +=sin(pow(p.x, 2.0) + time * i);
        color += abs(.02 / p.x) * rand(p.x) * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), st.y);
        }
    
        gl_FragColor = vec4(color, 1.0);
    }
    
    //Pulsing tangent lines
    if (time > 45.0) {
        vec2 p = uv();
        
        for (float i = 0.; i < 4.; i++) {
        p.x +=tan(p.x + time * i);
        color += abs(.0001/ noise(p.x)) * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), st.y);
        }
        
        gl_FragColor = vec4(color, 1.0);
    }
    
    //Transition to sweeping curves
    if (time > 60.0) {
        vec2 p = uv();
        for (float i = 0.; i < 5.; i++) {
        p.x +=sin(p.y + time * i);
        color += abs(.02 / p.x) * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), st.y);
        }
    
        gl_FragColor = vec4(color, 1.0);
    }
    
    //Cosine curves
    if (time > 60.0) {
        vec2 p = uvN();
        for (float i = 0.; i < 5.; i++) {
            p.y +=cos(p.y + time * i / 2.0);
            color += abs(.02 / p.y) * mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0),st.y);
        }
    
        gl_FragColor = vec4(color, 1.0);
    }
    
    
}