plugins {
    id("java")
    id("org.springframework.boot") version "3.2.0"
}

group = "me.zubrik"
version = ""

springBoot {
    mainClass.set("me.zubrik.todo.ToDo")
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.9.1"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}

tasks.test {
    useJUnitPlatform()
}

tasks.jar {
    enabled = false
}