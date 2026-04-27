import { ClickEvent } from '@kit.ArkUI';
import { CommonConstants } from '../utils/CommonConstants';
import { HdsListItemCard, PrefixIcon, IconSize, SuffixArrow } from '@kit.UIDesignKit';

@Preview
@ComponentV2
export struct SubItemButton {
  @Param symbol: Resource | undefined = $r('sys.symbol.tip_fit_test');
  @Param icon: Resource | undefined = undefined;
  @Require @Param text: ResourceStr | string = 'TEST';
  @Param description: string | Resource = '';
  @Param descriptionColor: ResourceColor = $r('sys.color.ohos_id_color_text_secondary');
  @Event onAction: (event?: ClickEvent) => void = () => {};

  build() {
    HdsListItemCard({
      cardPrefixMargin: $r('sys.float.padding_level2'),
      cardSuffixMargin: $r('sys.float.padding_level2'),
      cardBackgroundColor: $r('app.color.item_bg'),
      cardHeight: CommonConstants.SETTING_OPTION_CARD_HEIGHT,
      prefixItem: new PrefixIcon({
        iconSize: IconSize.SYSTEM_ICON,
        iconValue: this.icon !== undefined ? { symbol: this.icon } : { symbol: this.symbol! }
      }),
      textItem: {
        primaryText: { text: this.text },
        secondaryText: this.description != '' ? { text: this.description } : undefined
      },
      suffixItem: new SuffixArrow({}),
      onClick: () => {
        this.onAction();
      }
    })
  }
}
