# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

これはNix flakeテンプレートのリポジトリです。開発環境のテンプレートを提供し、`nix flake init`コマンドで利用できます。現在はNode.js Web開発環境のテンプレートを含んでいます。

## アーキテクチャ

### 構造
- ルートレベルの`flake.nix`: テンプレートの定義とメタデータ
- `templates/`: 実際のテンプレートファイルを格納

### テンプレートシステム
各テンプレートは独自の`flake.nix`を持ち、特定の開発環境をセットアップします。現在のnodejs-webテンプレートはaarch64-darwinシステム用に設定されています。

## 開発コマンド

### テンプレートの使用
```bash
# テンプレートを使用して新しいプロジェクトを初期化
nix flake init -t .#nodejs-web

# 開発環境に入る（テンプレート適用後）
nix develop
```

### テンプレートの検証
```bash
# 利用可能なテンプレートを表示
nix flake show

# テンプレートの構文チェック
nix flake check
```

## 新しいテンプレートの追加

1. `templates/`に新しいディレクトリを作成
2. そのディレクトリに`flake.nix`を作成し、必要な開発環境を定義
3. ルートの`flake.nix`の`templates`セクションに新しいテンプレートを追加
