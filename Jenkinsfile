pipeline {
  agent any
  stages {
    stage('Prepare') {
      steps {
        checkout(scm: scm, poll: true, changelog: true)
        sh './gradlew clean --stacktrace'
      }
    }
    stage('Build') {
      steps {
        sh './gradlew build --stacktrace'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh './gradlew buildImage --stacktrace'
      }
    }
    stage('Upload Archives') {
      steps {
        sh './gradlew uploadArchives --stacktrace'
        sh './gradlew pushImage --stacktrace'
      }
    }
    stage('Release') {
      when {
        branch 'master'
      }
      steps {
        sh './gradlew release -Prelease.useAutomaticVersion=true --stacktrace'
      }
    }
    stage('Workspace delete') {
      steps {
        deleteDir()
      }
    }
  }
}