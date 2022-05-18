import 'package:flutter/material.dart';

/// Tabの文字とクリックされた時表示するviewを格納するデータクラス
class TabItem {
  const TabItem({required this.tabId, required this.tab, required this.view});
  final String tabId;
  final Tab tab;
  final Widget view;
}