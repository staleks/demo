pipeline {
  agent any
  stages {
    stage('Prepare') {
      steps {
        checkout(scm: scm, poll: true, changelog: true)
        sh './gradlew clean --stacktrace'
      }
    }
    if (env.BRANCH_NAME == 'master') {
        stage('Release') {
          steps {
            sh './gradlew release -Prelease.useAutomaticVersion=true --stacktrace'
          }
        }
    } else {
        stage('Build') {
          steps {
            sh './gradlew build --stacktrace'
          }
        }
        stage('Push to Nexus') {
            sh './gradlew uploadArchives --stacktrace'
        }
        stage('Push Docker Image') {
          steps {
            sh './gradlew pushImage --stacktrace'
          }
        }
    }
    stage('Workspace delete') {
      steps {
        deleteDir()
      }
    }
  }
}