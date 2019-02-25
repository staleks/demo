pipeline {
  agent any
  stages {
    stage('Prepare') {
      steps {
        checkout(scm: scm, poll: true, changelog: true)
        sh './gradlew clean --stacktrace'
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
    stage('Build') {
      when not {
        branch 'master'
      }
      steps {
        sh './gradlew build --stacktrace'
      }
    }
    stage('Push to Nexus') {
        when not {
            branch 'master'
        }
        steps {
            sh './gradlew uploadArchives --stacktrace'
        }
    }
    stage('Push Docker Image') {
        when not {
            branch 'master'
        }
        steps {
            sh './gradlew pushImage --stacktrace'
        }
    }
    stage('Workspace delete') {
      steps {
        deleteDir()
      }
    }
  }
}